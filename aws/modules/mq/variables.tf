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
  description = "A list of tag blocks."
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------
# MQ config
#-----------------------------------------------------------
variable "enable_mq_configuration" {
  description = "Enabele MQ configuration"
  default     = false
}

variable "mq_configuration_name" {
  description = "The name of the configuration"
  default     = ""
}

variable "mq_configuration_description" {
  description = "(Optional) The description of the configuration."
  default     = ""
}

variable "engine_type" {
  description = "The type of broker engine. Currently, Amazon MQ supports only ActiveMQ."
  default     = "ActiveMQ"
}

variable "engine_version" {
  description = "The version of the broker engine. Currently, Amazon MQ supports only 5.15.0"
  default     = "5.15.8"
}

variable "mq_configuration_data" {
  description = "description"
  default     = ""
}

#-----------------------------------------------------------
# MQ broker
#-----------------------------------------------------------
variable "enable_mq_broker" {
  description = "Enable MQ broker usage"
  default     = false
}

variable "broker_name" {
  description = "The name of the broker."
  default     = ""
}

variable "host_instance_type" {
  description = "The broker's instance type. e.g. mq.t2.micro or mq.m4.large"
  default     = "mq.t2.micro"
}

variable "security_group_ids" {
  description = "The list of security group IDs assigned to the broker."
  default     = []
}

variable "subnet_ids" {
  description = "The list of subnet IDs in which to launch the broker. A SINGLE_INSTANCE deployment requires one subnet. An ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets."
  default     = []
}

variable "apply_immediately" {
  description = "Specifies whether any broker modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Enables automatic upgrades to new minor versions for brokers, as Apache releases the versions."
  default     = false
}

variable "deployment_mode" {
  description = "The deployment mode of the broker. Supported: SINGLE_INSTANCE and ACTIVE_STANDBY_MULTI_AZ. Defaults to SINGLE_INSTANCE."
  default     = "SINGLE_INSTANCE"
}

variable "publicly_accessible" {
  description = "Whether to enable connections from applications outside of the VPC that hosts the broker's subnets."
  default     = false
}

variable "configuration" {
  description = "Configuration of the broker."
  default     = []
}

variable "encryption_options" {
  description = "Configuration block containing encryption options"
  default     = []
}

variable "maintenance_window_start_time" {
  description = "Maintenance window start time"
  default     = []
}

variable "logs" {
  description = "(Optional) Logging configuration of the broker."
  default     = []
}

variable "user" {
  description = "The list of all ActiveMQ usernames for the specified broker."
  default     = []
}
