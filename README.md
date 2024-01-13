# Random CommitGen

## Overview

This script, `random-commitgen.sh`, is designed to create a specified number of random Git commits within a given date range in a specified repository. It's useful for testing, generating dummy commit histories, or simply populating a new repository with some initial data.

## Features

- **Operating System Compatibility:** Works on both macOS and other Unix-like systems.
- **Customizable Date Range:** Allows specifying a start and end date for commit generation. Defaults to the past year if no dates are provided.
- **Flexible Commit Counts:** Users can specify the number of commits to generate.
- **Repository Initialization:** Automatically initializes a Git repository if one does not exist at the specified path.

## Prerequisites

- Git must be installed on your system.
- Bash shell environment.

## Usage

To use the script, you must provide at least two arguments: the path to the repository and the number of commits to generate. Optionally, you can also specify a start and end date for the commit range.

```bash
bash random-commitgen.sh <repo_path> <num_commits> [<start_date> <end_date>]
```

### Parameters

- `<repo_path>`: Path to the Git repository where commits will be generated.
- `<num_commits>`: The number of random commits to create.
- `<start_date>`: _(Optional)_ Start date for the commit range in `YYYY-MM-DD` format. Defaults to one year ago if not specified.
- `<end_date>`: _(Optional)_ End date for the commit range in `YYYY-MM-DD` format. Defaults to today's date if not specified.

### Example

```bash
bash random-commitgen.sh /path/to/repo 50
```

This command will generate 50 random commits in the repository located at `/path/to/repo`, with dates ranging from one year ago to today.

## Running Directly from GitHub

You can also run the `random-commitgen.sh` script directly from GitHub without cloning or downloading the repository. This can be done using `curl` or `wget`.

### Using `curl`:

```bash
curl -sL https://raw.githubusercontent.com/ayxsth/random-commitgen/main/random-commitgen.sh | bash -s -- <repo_path> <num_commits> [<start_date> <end_date>]
```

### Using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/ayxsth/random-commitgen/main/random-commitgen.sh | bash -s -- <repo_path> <num_commits> [<start_date> <end_date>]
```

Replace `<repo_path>`, `<num_commits>`, `<start_date>`, and `<end_date>` with your desired values.

### Example:

```bash
curl -sL https://raw.githubusercontent.com/ayxsth/random-commitgen/main/random-commitgen.sh | bash -s -- /path/to/repo 50
```

Or:

```bash
wget -qO- https://raw.githubusercontent.com/ayxsth/random-commitgen/main/random-commitgen.sh | bash -s -- /path/to/repo 50
```

These commands will run the script directly from the GitHub repository and generate 50 random commits in the repository located at `/path/to/repo`, with dates ranging from one year ago to today.

## Notes

- This script creates empty commits with random dates within the specified range.
- Commits are marked with the message "random commit, lol".
