class ChangeColumnNameIngredients < ActiveRecord::Migration
  def change
    rename_column :recipes, :ingredient, :ingredients
  end
end
