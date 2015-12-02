# json_wrapper

SwiftyJSON inspired JSON lib for Ruby, very handy for JSON parsing and access while incoming JSON structure is not definite.

# Usage

```ruby
# { 
#   "key_a": 1,
#   "key_b": "2",
#   "key_c": [ 1 ],
#   "key_d": {
#     "a": 1 
#   } 
# }

raw_json = JSON.parse File.open("sample.json").read
json = JsonWrapper.new raw_json

json[:key_a].number? == true
json[:key_a].number == 1
json[:key_a].string == nil
json[:key_a].string! == "1"

json.kay_a.number? == true
json.key_a.number == 1
json.key_a.string == nil
json.kay_a.string! == "1"

json[:key_a][:key_not_exists].string == nil
json[:key_a][:key_not_exists].string! == ""

```

# LICENSE

See 'LICENSE', basically MIT license.
