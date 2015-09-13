defmodule ExSpecTest do
  use ExSpec, async: true

  test "standard tests work" do
    assert 1 + 1 == 2
  end

  it "handles top level tests" do
    assert 1 + 1 == 2
  end

  describe "describes" do
    describe "can be nested" do
      it "arbitrarily" do
        name = __ENV__.function |> elem(0)

        assert name == :"test describes can be nested arbitrarily"
      end
    end
  end

  describe "contexts" do
    context "can be nested" do
      it "as well" do
        name = __ENV__.function |> elem(0)

        assert name == :"test contexts can be nested as well"
      end
    end
  end

  describe "lets" do
    context "a context" do
      let :value, do: "is available"
      let :another_value, do: "is also available"

      it "is equivalent to a setup", c do
        assert c.value == "is available"
        assert c.another_value == "is also available"
      end
    end

    @tag :dont_run_me
    context "another context" do
      it  "does not leak into other contexts", c do
        assert c.value == nil
        assert c.another_value == nil
      end
    end
  end
end
