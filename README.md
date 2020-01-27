# Fonts on AWS Lambda Layer

Allows fonts to be used in Lambda function.

## Getting Started

1. Add this layer to Lambda function by providing the [layer version ARN](#version-arns).
2. Add `FONTCONFIG_PATH=/opt/etc/fonts` [environment variable](#environment-variable) to Lambda function.

## Version ARNs

### Amazon Linux fonts

These layers include fonts that were available in Amazon Linux operating system.

| Region         | ARN                                                                   |
| -------------- | --------------------------------------------------------------------- |
| ap-east-1      | arn:aws:lambda:ap-east-1:347599033421:layer:amazon_linux_fonts:1      |
| ap-northeast-1 | arn:aws:lambda:ap-northeast-1:347599033421:layer:amazon_linux_fonts:1 |
| ap-northeast-2 | arn:aws:lambda:ap-northeast-2:347599033421:layer:amazon_linux_fonts:1 |
| ap-south-1     | arn:aws:lambda:ap-south-1:347599033421:layer:amazon_linux_fonts:1     |
| ap-southeast-1 | arn:aws:lambda:ap-southeast-1:347599033421:layer:amazon_linux_fonts:1 |
| ap-southeast-2 | arn:aws:lambda:ap-southeast-2:347599033421:layer:amazon_linux_fonts:1 |
| ca-central-1   | arn:aws:lambda:ca-central-1:347599033421:layer:amazon_linux_fonts:1   |
| eu-central-1   | arn:aws:lambda:eu-central-1:347599033421:layer:amazon_linux_fonts:1   |
| eu-north-1     | arn:aws:lambda:eu-north-1:347599033421:layer:amazon_linux_fonts:1     |
| eu-west-1      | arn:aws:lambda:eu-west-1:347599033421:layer:amazon_linux_fonts:1      |
| eu-west-2      | arn:aws:lambda:eu-west-2:347599033421:layer:amazon_linux_fonts:1      |
| eu-west-3      | arn:aws:lambda:eu-west-3:347599033421:layer:amazon_linux_fonts:1      |
| sa-east-1      | arn:aws:lambda:sa-east-1:347599033421:layer:amazon_linux_fonts:1      |
| us-east-1      | arn:aws:lambda:us-east-1:347599033421:layer:amazon_linux_fonts:1      |
| us-east-2      | arn:aws:lambda:us-east-2:347599033421:layer:amazon_linux_fonts:1      |
| us-west-1      | arn:aws:lambda:us-west-1:347599033421:layer:amazon_linux_fonts:1      |
| us-west-2      | arn:aws:lambda:us-west-2:347599033421:layer:amazon_linux_fonts:1      |

### Stix fonts

These layers include [stix fonts](https://www.stixfonts.org/).

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

## Environment variable

Define the following environment variable for the Lambda function:

| Key               | Value            |
| ----------------- | ---------------- |
| `FONTCONFIG_PATH` | `/opt/etc/fonts` |

## Build and Publish

Refer to the Makefile to build and publish your own fonts layer.

### Scripts

| Script         | Description                                                         |
| -------------- | ------------------------------------------------------------------- |
| `./build.sh`   | Build a new layer zip                                               |
| `./publish.sh` | Publish the layer zip to regions specified in `/config/regions.txt` |
