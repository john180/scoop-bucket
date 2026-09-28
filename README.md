# John's Scoop Bucket

[![CI](https://github.com/john180/scoop-bucket/actions/workflows/ci.yml/badge.svg)](https://github.com/john180/scoop-bucket/actions/workflows/ci.yml)
[![Excavator](https://github.com/john180/scoop-bucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/john180/scoop-bucket/actions/workflows/excavator.yml)

Personal bucket for [Scoop](https://scoop.sh), the Windows command-line installer,
maintained in [john180/scoop-bucket](https://github.com/john180/scoop-bucket).

## Installation

Add the bucket, then install a package, for example:

```pwsh
scoop bucket add john180 https://github.com/john180/scoop-bucket
scoop install john180/cherry-studio
```

See [bucket](bucket) for the available manifests.

## Contributing

To make a new manifest contribution, please read the [Contributing
Guide](https://github.com/ScoopInstaller/.github/blob/main/.github/CONTRIBUTING.md)
and [App Manifests](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)
wiki page.

Copy `bucket/app-name.json.template` to `bucket/<app-name>.json`, fill in the
required fields, and remove unused fields. With Scoop installed, use the helper
scripts from the repository root to check and format your manifest:

```pwsh
.\bin\checkver.ps1 <app-name>
.\bin\formatjson.ps1 <app-name>
```

Run `.\bin\test.ps1` to execute the bucket tests. This requires PowerShell 5.1 or
later, BuildHelpers 2.0.1 or later, and Pester 5.2.0 or later.

## Repository automation

- CI tests manifests with both Windows PowerShell and PowerShell.
- Excavator checks for package updates every four hours and can also be run
  manually from GitHub Actions.
- Issue and pull request workflows handle verification requests.

For repository maintainers:

1. In `Settings` - `Actions` - `General` - `Actions permissions`, allow the
   actions used by these workflows. The upstream template recommends
   `Allow all actions and reusable workflows`.
2. Under `Workflow permissions`, select
   `Read repository contents and packages permissions`. Each workflow declares
   its required permissions explicitly.
3. To have this bucket indexed on [scoop.sh](https://scoop.sh), add the
   `scoop-bucket` repository topic.

`bin/auto-pr.ps1` targets `john180/scoop-bucket:master` by default.
