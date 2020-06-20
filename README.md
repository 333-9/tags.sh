<!-- 20.06 2020 -->

# tags.sh
Script to help search files

## usage
- Move tags.sh into your `PATH` (`/bin/local/bin`, or other).
- Create `.fstags` file in your directory.
- Add files with `tags.sh -a file`,
  then type list of tags separated by spaces (or tabs) into stdin.
- `tags.sh` without arguments
  will bring up a [fzy](https://github.com/jhawthorn/fzy) fuzzy finder.
  The file name will be output to stdout.

---

Note: directories are searched recursively for `.fstags`.
