# beanhub-import-demo
This is a demo repository meant to showcase beanhub-import. To kick start, you need to install dependencies first with poetry:

```bash
poetry install
```

Or, if you prefer using nixpkgs, you can also run:

```bash
nix develop
```

The above step shall install beanhub-cli for you.
You can run the following command in the poetry environment (as `poetry run bh import`) or in the nix environment:

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

Then run the import command again, and you will see it automatically remove the transactions from the `2024.bean` file, then create and insert those transactions to `2024Q1.bean` and `2024Q2.bean` instead.

<p align="center">
  <img src="https://github.com/LaunchPlatform/beanhub-import-demo/raw/master/assets/auto-txn-migration?raw=true" alt="Git diff screenshot showing Beancount transactions removed from the books/2024.bean file and new quater beancount files added" />
</p>

