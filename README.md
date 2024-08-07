# beanhub-import-demo
This is a demo repository meant to showcase [beanhub-import](https://github.com/LaunchPlatform/beanhub-import). To kick start, you need to install dependencies first with poetry:

```bash
poetry install
```

Or, if you prefer using nixpkgs, you can also run:

```bash
nix develop
```

The above step shall install [beanhub-cli](https://github.com/LaunchPlatform/beanhub-cli) for you.
You can run the following command in the poetry environment:

```bash
poetry run bh import
```

Or use `bh` command directly if you are using Nix:

```bash
bh import
```

You can then run 

```bash
git diff
```

To see the new transactions imported by beanhub-import.
Since our `books/2024.bean` only contains imported transactions before a certain day in 2024, by doing so should give you the new transactions after the day from the CSV file like this:

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/new-txns.png?raw=true" alt="Git diff screenshot showing new Beancount transactions added to the books/2024.bean file" />
</p>

Now, you can also modify the beanhub-import file at `.beanhub/imports.yaml` and run the import command again to see how it magically updates and moves all the imported transactions for you.
For example, say you want to import files into different quarter files instead of years.
You can then change the `default_file` value like this:

```
books/{{ date.year }}Q{{ ((date.month - 1) // 3) + 1  }}.bean
```

And the git diff looks like this:

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/quater-output-file.png?raw=true" alt="Git diff screenshot showing default_file changed to output quater file names instead of just year" />
</p>

Then run the import command again, and you will see it automatically remove the transactions from the `2024.bean` file, then create and insert those transactions to `2024Q1.bean` and `2024Q2.bean` instead.

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/auto-txn-migration.png?raw=true" alt="Git diff screenshot showing Beancount transactions removed from the books/2024.bean file and new quater beancount files added" />
</p>

Another example is when you want to add new tags to the imported transactions for expenses. You can modify the import file with a new tags field in the transaction template:

```YAML
tags:
  - BeanHubImportIsAwesome
```

And the git diff looks like this:

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/new-tags.png?raw=true" alt="Git diff screenshot showing new line" />
</p>

Then, run the import command again. And here you go!

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/new-tags-result.png?raw=true" alt="Git diff screenshot showing new tags added to all imported Beancount transactions" />
</p>

It's all declarative and idempotent.
With beanhub-import, you say goodbye to manually importing and maintaining transactions!
I hope you like this tool.
It's still in the early stage of development.
We are also working on making generating transactions from multiple sources possible.
Please feel free to open issues in the [beanhub-import](https://github.com/LaunchPlatform/beanhub-import) repository if you have any feedback 🙌
