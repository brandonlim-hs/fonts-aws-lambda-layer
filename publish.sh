#!/bin/bash

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -d, --description string  Description of the layer
  -h, --help                Show usage
  -t, --target string       Directory that contains layer zip
EOF
}

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -d | --description)
        shift
        LAYER_DESCRIPTION=$1
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    -t | --target)
        shift
        TARGET=$1
        ;;
    *)
        usage
        exit 1
        ;;
    esac
    shift
done

ARN_DIR="$TARGET/arns"
ARN_FILE="$ARN_DIR/$(basename "$TARGET").csv"
LAYER_NAME=$(basename "$TARGET")
LAYER_ZIP="$TARGET/layer.zip"
REGIONS=$(cat config/regions.txt)

if [ ! -f "$LAYER_ZIP" ]; then
    echo "No layer zip found in directory $TARGET"
    exit 1
fi

if [ -z "$LAYER_DESCRIPTION" ]; then
    echo "No layer description provided"
    exit 1
fi

if ! aws --version 1>/dev/null; then
    echo "aws command not found"
    exit 1
fi

rm -rf $ARN_DIR && mkdir -p $ARN_DIR

echo "Region,ARN" >$ARN_FILE
for region in $REGIONS; do
    printf "%s\n" "Region: $region"
    OUTPUT=$(
        aws lambda publish-layer-version \
            --description "$LAYER_DESCRIPTION" \
            --layer-name "$LAYER_NAME" \
            --output text \
            --query "[LayerVersionArn, Version]" \
            --region "$region" \
            --zip-file "fileb://$LAYER_ZIP"
    )
    LAYER_VERSION_ARN=$(echo $OUTPUT | awk '{print $1}')
    LAYER_VERSION=$(echo $OUTPUT | awk '{print $2}')
    aws lambda add-layer-version-permission \
        --action lambda:GetLayerVersion \
        --layer-name "$LAYER_NAME" \
        --output text \
        --principal "*" \
        --query "Statement" \
        --region "$region" \
        --statement-id public \
        --version-number "$LAYER_VERSION"
    echo "$region,$LAYER_VERSION_ARN" >>$ARN_FILE
    printf "\n"
done
