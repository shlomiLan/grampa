# Grampa
Find the oldest modified files in a repo. This library can run as a standalone (from source) or as a GitHub action.

## Usage

### As a GitHub action

```yaml
jobs:
  grampa_job:
    runs-on: ubuntu-latest
    name: Find oldest modified files
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - uses: shlomiLan/grampa@v2
        id: grampa
```

### To print the results as a comment in a PR (add to previous code)
```yaml
      - uses: jwalton/gh-find-current-pr@v1
        id: finder
      - uses: marocchino/sticky-pull-request-comment@v2
        with:
          header: test
          number: ${{ steps.finder.outputs.pr }}
          message: |
            Report results:
            ```
            ${{ steps.grampa.outputs.report }}
            ```
```

### From source
1. Clone the report
   ```bash
   git clone git@github.com:shlomiLan/grampa.git
   ```
2. Create the virtual env
   ```bash
   python3 -m venv venv
   ```
1. Activate the env
   ```bash
   source ./venv/bin/activate
   ```
1. Install requirments
   ```bash
    pip install -r requirements.txt
    ```
1. Run the script 
   ```bash 
   GITHUB_WORKSPACE=%PATH_TO_LOCAL_REPO% python -m main 
   ```
   1. `%PATH_TO_LOCAL_REPO%` example - `~/workspce/repo/repo1`


## Any problem?

Feel free to report issues
