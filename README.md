# GitHub Workflow Templates & Composite Actions

This repository contains shared GitHub Actions workflows and composite actions for use across multiple repositories.

## Directory Structure

- `.github/workflows/` — Place reusable workflow YAML files here.
- `.github/actions/` — Contains custom composite actions for CI/CD and automation.

## Available Composite Actions

- **Terraform Plan Composite Action**: Performs a Terraform plan and uploads the plan file.
- **Terraform Apply Composite Action**: Applies a Terraform plan to provision resources in Azure.
- **Checkov Scan Composite Action**: Runs Checkov security scans on Terraform code.

## Usage

Reference these actions in your repository workflows using the `uses:` syntax, e.g.:

```yaml
- name: Terraform Plan
  uses: spectrum048k/github-templates/.github/actions/terraform-plan-composite@main
  with:
    working-directory: ./infra
    ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
```

## Example: Using the Reusable Terraform CI Workflow

This example demonstrates how to call the reusable workflow from another repository using `workflow_call`.

Create a workflow file in your repository (e.g., `.github/workflows/infra-ci.yml`):

```yaml
name: Infra CI

on:
  workflow_dispatch:

jobs:
  terraform:
    uses: spectrum048k/github-templates/.github/workflows/terraform-ci.yml@main
    with:
      working-directory: ./infra
      ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
      ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
      ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
      checkov-path: ./infra
```

- Replace `spectrum048k/github-templates` with your repo name if different.
- Adjust input values as needed for your project.
- Make sure required secrets are set in your repository settings.

## Federated Credentials

These actions are designed to work with Azure federated credentials, allowing secure authentication without passing secrets. You should configure your Azure environment to use OIDC (OpenID Connect) federation with GitHub Actions. This enables the workflow to authenticate using the provided ARM_CLIENT_ID, ARM_TENANT_ID, and ARM_SUBSCRIPTION_ID, without needing ARM_CLIENT_SECRET.

Refer to the [Azure documentation](https://learn.microsoft.com/en-us/azure/active-directory/develop/workload-identity-federation) for setup instructions.

## Contributing

Feel free to submit issues or pull requests to improve or add new workflows and actions.
