# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

1. ##### Clone the repository down locally.
   - ##### `git clone https://github.com/kfincher/Project2-PetStore`
2. ##### In VS Studio Code, in force-app\main\default 
   - ##### In autoResponseRules\CaseautoResponseRules-meta.xml, replace the email in <senderemail> with a user's email from your org 
   - ##### in escalationRules\CaseescalationRules-meta.xml, replace the emails in both instance of <notifyTo> with a user's username from your org 
   - ##### In settings\Case.settings=meta.xml, replace the email in <defaultCaseOwner> with a user's username from your org
   - ##### Deploy to org using: `sfdx force:source:deploy -x manifest/package.xml`

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
