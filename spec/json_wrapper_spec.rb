require_relative "../lib/json_wrapper"
require 'json'

json = JSON.parse File.open(File.expand_path("../sample.json", __FILE__)).read
j = JsonWrapper.new json

RSpec.describe JsonWrapper do
  it "should work with string" do
    expect(j[:string_value].string?).to eq(true)
    expect(j[:number_value].string?).to eq(false)
    expect(j[:number_value_2].string?).to eq(false)
    expect(j[:array_value].string?).to eq(false)
    expect(j[:hash_value].string?).to eq(false)
    expect(j[:null_value].string?).to eq(false)

    expect(j[:string_value].string!).to eq("2")
    expect(j[:number_value].string!).to eq("1")
    expect(j[:number_value_2].string!).to eq("1.1")
    expect(j[:array_value].string!).to eq("")
    expect(j[:hash_value].string!).to eq("")
    expect(j[:null_value].string!).to eq("")

    expect(j[:string_value].string).to eq("2")
    expect(j[:number_value].string).to eq(nil)
    expect(j[:number_value_2].string).to eq(nil)
    expect(j[:array_value].string).to eq(nil)
    expect(j[:hash_value].string).to eq(nil)
    expect(j[:null_value].string).to eq(nil)
  end
  it "should work with number" do
    expect(j[:string_value].number?).to eq(false)
    expect(j[:number_value].number?).to eq(true)
    expect(j[:number_value_2].number?).to eq(true)
    expect(j[:array_value].number?).to eq(false)
    expect(j[:hash_value].number?).to eq(false)
    expect(j[:null_value].number?).to eq(false)

    expect(j[:string_value].number!).to eq(2)
    expect(j[:string_value_2].number!).to eq(0)
    expect(j[:number_value].number!).to eq(1)
    expect(j[:number_value_2].number!).to eq(1.1)
    expect(j[:array_value].number!).to eq(0)
    expect(j[:hash_value].number!).to eq(0)
    expect(j[:null_value].number!).to eq(0)

    expect(j[:string_value].number).to eq(nil)
    expect(j[:number_value].number).to eq(1)
    expect(j[:number_value_2].number).to eq(1.1)
    expect(j[:array_value].number).to eq(nil)
    expect(j[:hash_value].string).to eq(nil)
    expect(j[:null_value].string).to eq(nil)
  end
  it "should work with array" do
    expect(j[:string_value].array?).to eq(false)
    expect(j[:number_value].array?).to eq(false)
    expect(j[:number_value_2].array?).to eq(false)
    expect(j[:array_value].array?).to eq(true)
    expect(j[:hash_value].array?).to eq(false)
    expect(j[:null_value].array?).to eq(false)

    expect(j[:string_value].array!).to eq([])
    expect(j[:number_value].array!).to eq([])
    expect(j[:number_value_2].array!).to eq([])
    expect(j[:array_value].array!).to eq([1])
    expect(j[:hash_value].array!).to eq([])
    expect(j[:null_value].array!).to eq([])

    expect(j[:string_value].array).to eq(nil)
    expect(j[:number_value].array).to eq(nil)
    expect(j[:number_value_2].array).to eq(nil)
    expect(j[:array_value].array).to eq([1])
    expect(j[:hash_value].array).to eq(nil)
    expect(j[:null_value].array).to eq(nil)
  end
  it "should work with hash" do
    expect(j[:string_value].hash?).to eq(false)
    expect(j[:number_value].hash?).to eq(false)
    expect(j[:number_value_2].hash?).to eq(false)
    expect(j[:array_value].hash?).to eq(false)
    expect(j[:hash_value].hash?).to eq(true)
    expect(j[:null_value].hash?).to eq(false)

    expect(j[:string_value].hash!).to eq({})
    expect(j[:number_value].hash!).to eq({})
    expect(j[:number_value_2].hash!).to eq({})
    expect(j[:array_value].hash!).to eq({})
    expect(j[:hash_value].hash!).to eq({"a"=>"a"})
    expect(j[:null_value].hash!).to eq({})

    expect(j[:string_value].hash).to eq(nil)
    expect(j[:number_value].hash).to eq(nil)
    expect(j[:number_value_2].hash).to eq(nil)
    expect(j[:array_value].hash).to eq(nil)
    expect(j[:hash_value].hash).to eq({"a"=>"a"})
    expect(j[:null_value].hash).to eq(nil)
  end
  it "should work with chain invocation" do
    expect(j[:hash_value_2][:string_value].string).to eq("2")
    expect(j[:hash_value_2][:string_value].number).to eq(nil)
    expect(j[:hash_value_2][:string_value].array).to eq(nil)
    expect(j[:hash_value_2][0].array).to eq(nil)

    expect(j[:array_value_2][0].string).to eq "2"
    expect(j[:array_value_2][1].string!).to eq '1'
    expect(j[:array_value_2][1].number).to eq 1
    expect(j[:array_value_2][3].number!).to eq 0
    expect(j[:array_value_2][3].string!).to eq ""

    expect(j[:what][:hello].null?).to eq true
    expect(j[:what][:hello].array!).to eq []
  end
end
