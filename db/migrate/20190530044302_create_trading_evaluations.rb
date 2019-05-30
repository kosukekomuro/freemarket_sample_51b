class CreateTradingEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :trading_evaluations do |t|
      t.string :evaluation, null: false

      t.timestamps null: false
    end
  end
end
