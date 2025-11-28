# Permission Test - GitHub Package Publishing

A dummy package for testing GitHub Packages publishing.

## Setup

1. **Replace placeholders** in these files with your GitHub username:
   - `package.json` - replace `YOUR_GITHUB_USERNAME` in the `name` and `repository.url` fields
   - `.npmrc` - replace `YOUR_GITHUB_USERNAME` with your username

2. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Setup package publishing"
   git push
   ```

3. **Ensure repo settings allow packages**:
   - Go to your repo Settings → Actions → General
   - Under "Workflow permissions", select "Read and write permissions"

## Publishing

### Option 1: Manual Trigger via GitHub UI

1. Go to your repo on GitHub
2. Click **Actions** tab
3. Select **Publish Package** workflow
4. Click **Run workflow**
5. Choose version bump type (patch/minor/major)
6. Click **Run workflow**

### Option 2: Using the Script (requires GitHub CLI)

```bash
# Install GitHub CLI if needed
brew install gh

# Authenticate
gh auth login

# Trigger publish with patch bump (default)
./publish.sh

# Or specify bump type
./publish.sh minor
./publish.sh major
```

### Option 3: Create a Release

Creating a release on GitHub will also trigger the publish workflow.

## Installing Your Package

Once published, others can install it with:

```bash
npm install @YOUR_GITHUB_USERNAME/permission-test --registry=https://npm.pkg.github.com
```

They'll need to authenticate with GitHub Packages first:
```bash
npm login --registry=https://npm.pkg.github.com
```

## Checking Published Packages

View your packages at:
`https://github.com/YOUR_GITHUB_USERNAME?tab=packages`
