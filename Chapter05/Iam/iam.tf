provider "aws" {
  region = "us-east-1"
}

### Creating all the users defind in var.names, it is a list of strings.

resource "aws_iam_user" "example_user" {
  count = length(var.names)
  name  = "martiUser.${element(var.names, count.index)}"
}

data "aws_iam_policy_document" "ec2_read_only" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ec2_read_only" {
  name   = "ec2_read_only_policy"
  policy = data.aws_iam_policy_document.ec2_read_only.json
}

resource "aws_iam_policy_attachment" "ec2_access" {
  name       = "attachment_ec2_read_only_Describe"
  count      = length(var.names)
  users      = [element(aws_iam_user.example_user.*.name, count.index)]
  policy_arn = aws_iam_policy.ec2_read_only.arn
}


output "listOfNames" {
  value = aws_iam_user.example_user.*.name
}

### Defininng cloudwatch resources 

### Cloudwatch read-only

data "aws_iam_policy_document" "cloudwatch_read_only" {
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:Describe*", "cloudwatch:Get*", "cloudwatch:List*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cloudwatch_read_only" {
  name   = "cloudwatch-read-only"
  policy = "${data.aws_iam_policy_document.cloudwatch_read_only.json}"
}


### Cloudwatch full access

data "aws_iam_policy_document" "cloudwatch_full_access" {
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cloudwatch_full_access" {
  name   = "cloudwatch-full-access"
  policy = "${data.aws_iam_policy_document.cloudwatch_full_access.json}"
}

### Assinging appropriate resource 

### If give_sheldon_cloudwatch_full_access is set to false (not string false,but bool), sheldon is getting read only access.

resource "aws_iam_user_policy_attachment" "sheldon_cloudwatch_read_only" {
  count = "${tobool(var.give_sheldon_cloudwatch_full_access) == false ? 1 : 0}"

  user       = "${aws_iam_user.example_user.0.name}"
  policy_arn = "${aws_iam_policy.cloudwatch_read_only.arn}"

}

resource "aws_iam_user_policy_attachment" "sheldon_cloudwatch_full_access" {
  count = "${tobool(var.give_sheldon_cloudwatch_full_access) == true ? 1 : 0}"

  user       = "${aws_iam_user.example_user.0.name}"
  policy_arn = "${aws_iam_policy.cloudwatch_full_access.arn}"
}


