# P6's POSIX.2: p6df-redis

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### aws

##### p6df-redis/lib/aws/token.sh

- `str token = p6df::modules::redis::aws::token::get(group_id, user_id, [region=$AWS_REGION])`
  - Args:
    - group_id - 
    - user_id - 
    - OPTIONAL region - [$AWS_REGION]

#### p6df-redis

##### p6df-redis/init.zsh

- `p6df::modules::redis::deps()`
- `p6df::modules::redis::external::brew()`
- `p6df::modules::redis::init(_module, dir)`
  - Args:
    - _module - 
    - dir - 
- `p6df::modules::redis::langs()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── aws
│       └── token.sh
└── README.md

3 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
