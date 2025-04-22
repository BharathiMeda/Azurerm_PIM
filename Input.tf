variable "subscription_id" {
  description = "The subscription ID where the resources will be deployed"
  type        = string
}

variable "principal_id" {
  description = "The Azure AD object ID of the user or group to assign the role"
  type        = string
}

variable "role_definition_name" {
  description = "The name of the Azure role definition to assign (e.g., 'Contributor', 'Owner')"
  type        = string
  default     = "Contributor"
}

variable "pim_scope" {
  description = "The scope for the PIM role assignment (e.g., subscription, resource group, or specific resource)"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
  default     = "East US"
}

variable "pim_activation_uri" {
  description = "The Azure REST API URI for activating PIM roles"
  type        = string
  default     = "https://management.azure.com/providers/Microsoft.Authorization/roleAssignments/{roleAssignmentId}/activate?api-version=2020-10-01"
}
