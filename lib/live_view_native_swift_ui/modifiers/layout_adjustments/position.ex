defmodule LiveViewNativeSwiftUi.Modifiers.Position do
  use LiveViewNativePlatform.Modifier

  modifier_schema "position" do
    field :x, :float, default: 0.0
    field :y, :float, default: 0.0
  end
end
