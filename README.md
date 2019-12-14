# Fonts on AWS Lambda Layer

Allows fonts to be used in Lambda function. Currently this layer includes [stix-fonts](https://www.stixfonts.org/) only.

## Getting Started

Add this layer to Lambda function by providing the layer version ARN.

`arn:aws:lambda:{region}:347599033421:layer:stix-fonts:1`

## Version ARNs

| Region         | ARN                                                           |
| -------------- | ------------------------------------------------------------- |
| ap-east-1      | arn:aws:lambda:ap-east-1:347599033421:layer:stix-fonts:1      |
| ap-northeast-1 | arn:aws:lambda:ap-northeast-1:347599033421:layer:stix-fonts:1 |
| ap-northeast-2 | arn:aws:lambda:ap-northeast-2:347599033421:layer:stix-fonts:1 |
| ap-south-1     | arn:aws:lambda:ap-south-1:347599033421:layer:stix-fonts:1     |
| ap-southeast-1 | arn:aws:lambda:ap-southeast-1:347599033421:layer:stix-fonts:1 |
| ap-southeast-2 | arn:aws:lambda:ap-southeast-2:347599033421:layer:stix-fonts:1 |
| ca-central-1   | arn:aws:lambda:ca-central-1:347599033421:layer:stix-fonts:1   |
| eu-central-1   | arn:aws:lambda:eu-central-1:347599033421:layer:stix-fonts:1   |
| eu-north-1     | arn:aws:lambda:eu-north-1:347599033421:layer:stix-fonts:1     |
| eu-west-1      | arn:aws:lambda:eu-west-1:347599033421:layer:stix-fonts:1      |
| eu-west-2      | arn:aws:lambda:eu-west-2:347599033421:layer:stix-fonts:1      |
| eu-west-3      | arn:aws:lambda:eu-west-3:347599033421:layer:stix-fonts:1      |
| sa-east-1      | arn:aws:lambda:sa-east-1:347599033421:layer:stix-fonts:1      |
| us-east-1      | arn:aws:lambda:us-east-1:347599033421:layer:stix-fonts:1      |
| us-east-2      | arn:aws:lambda:us-east-2:347599033421:layer:stix-fonts:1      |
| us-west-1      | arn:aws:lambda:us-west-1:347599033421:layer:stix-fonts:1      |
| us-west-2      | arn:aws:lambda:us-west-2:347599033421:layer:stix-fonts:1      |

## Usage

`fonts.conf` will be extracted to `/opt/etc/fonts`, and fonts will be extracted to the `usr/share/fonts`

Define the following environment variable for the Lambda function:

| Key               | Value            |
| ----------------- | ---------------- |
| `FONTCONFIG_PATH` | `/opt/etc/fonts` |

## Build| Publish

Refer to the following scripts to build and publish your own fonts layer.

1. Run `./build.sh` to build a new layer zip.
2. Run `./publish.sh` to publish the layer zip to regions specified in `/config/regions.txt`.
