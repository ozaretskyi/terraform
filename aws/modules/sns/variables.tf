#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------
# SNS topic
#-----------------------------------------------------------
variable "enable_sns_topic" {
  description = "Enable SNS topic usage"
  default     = false
}

variable "sns_topic_name" {
  description = "The friendly name for the SNS topic. By default generated by Terraform."
  default     = ""
}

variable "sns_topic_name_prefix" {
  description = "(Optional) The friendly name for the SNS topic. Conflicts with sns_topic_name."
  default     = ""
}

variable "display_name" {
  description = "(Optional) The display name for the SNS topic"
  default     = ""
}

variable "sns_topic_delivery_policy" {
  description = "(Optional) The SNS delivery policy."
  default     = ""
}

variable "sns_topic_policy" {
  description = "(Optional) The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform"
  default     = "value"
}

variable "application_success_feedback_role_arn" {
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "application_failure_feedback_role_arn" {
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "kms_master_key_id" {
  description = "(Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "description"
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "description"
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

#-----------------------------------------------------------
# SNS topic policy
#-----------------------------------------------------------
variable "enable_sns_topic_policy" {
  description = "Enable sns topic policy usage"
  default     = false
}

#-----------------------------------------------------------
# SNS topic subscription
#-----------------------------------------------------------
variable "enable_sns_topic_subscription" {
  description = "Enable sns topic subscription usage"
  default     = false
}

variable "topic_arn" {
  description = "(Required) The ARN of the SNS topic to subscribe to"
  default     = ""
}


variable "sns_protocol" {
  description = "The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported, see below) (email is option but unsupported)."
  default     = "sqs"
}

variable "sns_endpoint" {
  description = "The endpoint to send data to, the contents will vary with the protocol."
  default     = ""
}

variable "confirmation_timeout_in_minutes" {
  description = "Set timeout in minutes. Integer indicating number of minutes to wait in retying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols (default is 1 minute)."
  default     = 1
}

variable "endpoint_auto_confirms" {
  description = "Enable endpoint auto confirms. Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)"
  default     = false
}

variable "raw_message_delivery" {
  description = "Set raw message delivery.Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) (default is false)."
  default     = false
}

variable "filter_policy" {
  description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource."
  default     = ""
}

#---------------------------------------------------
# SNS sms preferences
#---------------------------------------------------
variable "enable_sns_sms_preferences" {
  description = "Enable sns sms preferences usage"
  default     = false
}

variable "monthly_spend_limit" {
  description = "(Optional) The maximum amount in USD that you are willing to spend each month to send SMS messages."
  default     = null
}

variable "delivery_status_iam_role_arn" {
  description = "(Optional) The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs."
  default     = null
}

variable "delivery_status_success_sampling_rate" {
  description = "(Optional) The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value must be between 0 and 100."
  default     = null
}

variable "default_sender_id" {
  description = "(Optional) A string, such as your business brand, that is displayed as the sender on the receiving device."
  default     = null
}

variable "default_sms_type" {
  description = "(Optional) The type of SMS message that you will send by default. Possible values are: Promotional, Transactional"
  default     = null
}

variable "usage_report_s3_bucket" {
  description = "(Optional) The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS."
  default     = null
}

#---------------------------------------------------
# SNS sms preferences
#---------------------------------------------------
variable "enable_sns_platform_application" {
  description = "Enable sns platform application usage"
  default     = false
}

variable "sns_platform_application_name" {
  description = "The friendly name for the SNS platform application"
  default     = ""
}

variable "platform" {
  description = "(Required) The platform that the app is registered with."
  default     = ""
}

variable "platform_credential" {
  description = "(Required) Application Platform credential. "
  default     = ""
}

variable "event_delivery_failure_topic_arn" {
  description = "(Optional) SNS Topic triggered when a delivery to any of the platform endpoints associated with your platform application encounters a permanent failure."
  default     = null
}

variable "event_endpoint_created_topic_arn" {
  description = "(Optional) SNS Topic triggered when a new platform endpoint is added to your platform application."
  default     = null
}

variable "event_endpoint_deleted_topic_arn" {
  description = "(Optional) SNS Topic triggered when an existing platform endpoint is deleted from your platform application."
  default     = null
}

variable "event_endpoint_updated_topic_arn" {
  description = "(Optional) SNS Topic triggered when an existing platform endpoint is changed from your platform application."
  default     = null
}

variable "failure_feedback_role_arn" {
  description = "(Optional) The IAM role permitted to receive failure feedback for this application."
  default     = null
}

variable "platform_principal" {
  description = "(Optional) Application Platform principal."
  default     = null
}

variable "success_feedback_role_arn" {
  description = "(Optional) The IAM role permitted to receive success feedback for this application."
  default     = null
}

variable "success_feedback_sample_rate" {
  description = "(Optional) The percentage of success to sample (0-100)"
  default     = null
}
