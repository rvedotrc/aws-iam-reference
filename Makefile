# Copyright 2016 Rachel Evans
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SHELL=/bin/bash

.PHONY: update

all-actions.txt: var/app.json bin/all-actions
	./bin/all-actions > $@.tmp && mv $@.tmp $@

var/app.json: var/policies.js
	set -o pipefail && node bin/extract-app.js | jq --sort-keys . > $@.tmp && mv $@.tmp $@

var/policies.js:
	mkdir -p var
	curl -o $@.tmp https://awspolicygen.s3.amazonaws.com/js/policies.js && mv $@.tmp $@

update:
	rm -f var/policies.js
	$(MAKE)

