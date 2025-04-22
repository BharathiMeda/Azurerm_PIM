resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_user.example.id
}

# PIM configuration is not natively supported directly in Terraform, so you'll need to use Azure REST API integration.
resource "null_resource" "pim_role_assignment" {
  provisioner "local-exec" {
    command = <<EOT
      az rest --method post --uri "https://management.azure.com/providers/Microsoft.Authorization/roleAssignments/{roleAssignmentId}/activate?api-version=2020-10-01" \
      --body '{"properties": {"principalId": "<principal_id>", "roleDefinitionId": "<role_definition_id>", "scope": "<scope>"}}'
    EOT
  }

  triggers = {
    role_assignment_id = azurerm_role_assignment.example.id
  }
}

data "azurerm_subscription" "primary" {
  
}

data "azuread_user" "example" {
  user_principal_name = "user@example.com"
}
