class AddSwapIdReferencesToOffers < ActiveRecord::Migration[6.1]
  def change
    add_reference :offers, :initiator_swap, foreign_key: {to_table: :swaps}
    add_reference :offers, :creator_swap, foreign_key: {to_table: :swaps}
  end
end
