// Copyright 2016 Rachel Evans
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

app = {};
EnvInfo = {};
_ = {
  has: function () { return false; },
  extend: function () { },
};
require('../var/policies.js');
let allActions = [];
let services = app["PolicyEditorConfig"]["serviceMap"];

for (let service in services) {
    let details = services[service];

    if (!details.Actions) {
        continue;
    }

    details.Actions.map(a => {
        allActions.push(`${details.StringPrefix}:${a}`)
    });
}

allActions.sort();
allActions.map(a => console.log(a));