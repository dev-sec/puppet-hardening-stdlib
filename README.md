# Hardening Stdlib (puppet)

## Description

Shared functions for hardening modules.

## Requirements

* Puppet; nothing else

## Usage

### merge_hardening

Try to set a hardening parameter. The user still has the option to override it,
which will result in a warning.

For simple values:

    # Only defined by hardening:
    # $original_option = undef
    # $hardening_option = "off"
    # $merged_option = "off"
    $merged_option = merge_hardening( $original_option, $hardening_option )

    # User override:
    # $original_option = "on"
    # $hardening_option = "off"
    # $merged_option = "on" (emits a warning)
    $merged_option = merge_hardening( $original_option, $hardening_option )

For maps:

    # Only defined by hardening:
    # $original_option = { a: "on" }
    # $hardening_option = { b: "off" }
    # $merged_option = { a: "on", b: "off" }
    $merged_option = merge_hardening( $original_option, $hardening_option )

    # User override:
    # $original_option = { a: "on", b: "on" }
    # $hardening_option = { b: "off" }
    # $merged_option = { a: "on", b: "on" } (emits a warning)
    $merged_option = merge_hardening( $original_option, $hardening_option )


## Contributors + Kudos

...

## License and Author

* Author:: Dominik Richter <dominik.richter@gmail.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
