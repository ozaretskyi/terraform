#---------------------------------------------------
# AWS LB listeners
#---------------------------------------------------
resource "aws_lb_listener" "alb_listener" {
  count = var.enable_alb_listener ? 1 : 0

  load_balancer_arn = var.alb_listener_load_balancer_arn != "" && ! var.enable_alb ? var.alb_listener_load_balancer_arn : element(aws_lb.alb.*.arn, 0)
  port              = var.alb_listener_port
  protocol          = upper(var.alb_listener_protocol)

  ssl_policy      = var.alb_listener_ssl_policy
  certificate_arn = var.alb_listener_certificate_arn

  default_action {
    target_group_arn = var.alb_listener_default_action_target_group_arn != null && ! var.enable_alb_target_group ? var.alb_listener_default_action_target_group_arn : element(aws_lb_target_group.alb_target_group.*.arn, 0)
    type             = var.alb_listener_default_action_type

    dynamic "fixed_response" {
      iterator = fixed_response
      for_each = var.alb_listener_default_action_fixed_response
      content {
        content_type = lookup(fixed_response.value, "content_type", null)

        message_body = lookup(fixed_response.value, "message_body", null)
        status_code  = lookup(fixed_response.value, "status_code", null)
      }
    }

    dynamic "forward" {
      iterator = forward
      for_each = var.alb_listener_default_action_forward
      content {
        target_group {
          arn = lookup(redirect.value, "target_group_arn", null)

          weight = lookup(redirect.value, "target_group_weight", null)
        }
        stickiness {
          enabled  = lookup(redirect.value, "stickiness_enabled", null)
          duration = lookup(redirect.value, "stickiness_duration", null)
        }
      }
    }

    dynamic "redirect" {
      iterator = redirect
      for_each = var.alb_listener_default_action_redirect
      content {
        status_code = lookup(redirect.value, "status_code", null)

        host     = lookup(redirect.value, "host", null)
        path     = lookup(redirect.value, "path", null)
        port     = lookup(redirect.value, "port", null)
        protocol = lookup(redirect.value, "protocol", null)
        query    = lookup(redirect.value, "query", null)
      }
    }

    dynamic "authenticate_cognito" {
      iterator = authenticate_cognito
      for_each = var.alb_listener_default_action_authenticate_cognito
      content {
        user_pool_client_id = lookup(authenticate_cognito.value, "user_pool_client_id", null)
        user_pool_domain    = lookup(authenticate_cognito.value, "user_pool_domain", null)
        user_pool_arn       = lookup(authenticate_cognito.value, "user_pool_arn", null)

        authentication_request_extra_params = lookup(authenticate_cognito.value, "authentication_request_extra_params", null)
        on_unauthenticated_request          = lookup(authenticate_cognito.value, "on_unauthenticated_request", null)
        scope                               = lookup(authenticate_cognito.value, "scope", null)
        session_cookie_name                 = lookup(authenticate_cognito.value, "session_cookie_name", null)
        session_timeout                     = lookup(authenticate_cognito.value, "session_timeout", null)
      }
    }

    dynamic "authenticate_oidc" {
      iterator = authenticate_oidc
      for_each = var.alb_listener_default_action_authenticate_oidc
      content {
        authorization_endpoint = lookup(authenticate_oidc.value, "authorization_endpoint", null)
        client_id              = lookup(authenticate_oidc.value, "client_id", null)
        client_secret          = lookup(authenticate_oidc.value, "client_secret", null)
        issuer                 = lookup(authenticate_oidc.value, "issuer", null)
        token_endpoint         = lookup(authenticate_oidc.value, "token_endpoint", null)
        user_info_endpoint     = lookup(authenticate_oidc.value, "user_info_endpoint", null)

        authentication_request_extra_params = lookup(authenticate_oidc.value, "authentication_request_extra_params", null)
        on_unauthenticated_request          = lookup(authenticate_oidc.value, "on_unauthenticated_request", null)
        scope                               = lookup(authenticate_oidc.value, "scope", null)
        session_cookie_name                 = lookup(authenticate_oidc.value, "session_cookie_name", null)
        session_timeout                     = lookup(authenticate_oidc.value, "session_timeout", null)
      }
    }

  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_lb.alb,
    aws_lb_target_group.alb_target_group
  ]
}
