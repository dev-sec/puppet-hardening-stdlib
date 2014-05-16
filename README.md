# Hardening Stdlib (puppet)

## Description

Shared functions for hardening modules.

## Requirements

* Puppet; nothing else

## Usage

### merge_hardening

Try to set a hardening parameter. The user still has the option to override it,
which will result in a warning.

Parameters

    merge_hardening( $original, $hardening, [ $name_of_parameter ] )

The `$name_of_parameter` is optional, but highly recommended to know which parameter
results in a Warning.

For simple values:

    # Only defined by hardening:
    # $original_option = undef
    # $hardening_option = "off"
    # $merged_option = "off"
    $merged_option = merge_hardening( $original_option, $hardening_option, "param <name>" )

    # User override:
    # $original_option = "on"
    # $hardening_option = "off"
    # $merged_option = "on" (emits a warning)
    $merged_option = merge_hardening( $original_option, $hardening_option, "param <name>" )

For maps:

    # Only defined by hardening:
    # $original_option = { a: "on" }
    # $hardening_option = { b: "off" }
    # $merged_option = { a: "on", b: "off" }
    $merged_option = merge_hardening( $original_option, $hardening_option, "map <name>" )

    # User override:
    # $original_option = { a: "on", b: "on" }
    # $hardening_option = { b: "off" }
    # $merged_option = { a: "on", b: "on" } (emits a warning)
    $merged_option = merge_hardening( $original_option, $hardening_option, "map <name>" )

### getparam

Taken from stdlib 4.2. You don't need to require this version of stdlib, but
still get access to this function. See: [stdlib v4.2 getparam description](https://github.com/puppetlabs/puppetlabs-stdlib/tree/08b00d9229961d7b3c3cba997bfb35c8d47e4c4b#getparam)

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
