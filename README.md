This repository is based on [Krater](https://github.com/paolobrasolin/krater),
a tool for building math-rich websites; the purpose of the present code is to
support "Stacks Project"-style websites, where you create a bunch of files like
`_nodes/00A4.md` that may import each other, and then specify a root like
`_lectures/lecture.md` that imports some node.

### Running on your machine

You will need a running LaTeX installation, including `latexmk`, `dvisvgm` and whatever engine and packages you plan on using.
Chances are that if you're reading this you already have everything you need.

You will need to [install Ruby 2.7.5][ruby-install-url]; you will need to ensure that
you have ghostscript installed, with the `LIBGS` environment variable correctly
set. On macOS with Homebrew, after installing ghostscript you must add the
following line to your `.bashrc` or `.zshrc`:

```bash
export LIBGS=/opt/homebrew/lib/libgs.dylib
```

After that, you can simply

```bash
# install dependencies
bundle
# run Jekyll
bundle exec jekyll serve
```

and your website will be available at `http://127.0.0.1:4000/<REPO_NAME>/`.

[ruby-install-url]: https://www.ruby-lang.org/it/documentation/installation/


### Node UID policy

Node UIDs should be added in order; so if the greatest node UID is `00X2`, hen
the next node that is committed should be `00X3`. When a new node `00X3` is
committed, it is permanent: it is not permitted to rename it, however it is
permitted to *delete* it.

If two branches contain drafted nodes, when one is merged, the node UIDs chosen
on the other branch have to be renamed so that when *they* are committed to
`main`, there are no conflicts and node UIDs are consecutive. This causes can
cause friction, so we recommend merging quickly, or even pushing commits directly
to `main` if you are sure that the change is OK.

The script `mint-node.rkt` will assist you in determining what the next
permanent UID is.
