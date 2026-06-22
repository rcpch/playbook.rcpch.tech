---
title: Removing committed system files eg .DS_Store
topic_id: 525
url: https://forum.rcpch.tech/t/removing-committed-system-files-eg-ds-store/525
pulled_at: 2026-06-22T09:57:55Z
---

### `find`
I have a ready-made command for finding and removing system files like .DS_Store which are often inadvertently committed to version control, but don't need to be in our repo.

Recursively find these files in the current directory:
```
find . -type f -name ".DS_Store" -print
```

Recursively remove them (without confirmation)
```
find . -type f -name ".DS_Store" -exec rm {} \;
```

### `.gitignore`
Then you should add a line to the `.gitignore` file in the root of the project that will ignore any future generated .DS_Store files.


```
# .gitignore

other .gitignore contents

...

# Avoid committing generated native files:
# MacOS
.DS_Store
```
<div data-theme-toc="true"> </div>
