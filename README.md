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
    ARM_CLIENT_SECRET: ${{ secrets.ARM_CLIENT_SECRET }}
    ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
    ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
```

## Contributing

Feel free to submit issues or pull requests to improve or add new workflows and actions.
