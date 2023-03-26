ActiveAdmin.register User do
  filter :name
  filter :country
  filter :score, as: :numeric_range
  filter :created_at
  filter :updated_at

  controller do
    def apply_sorting(chain)
      chain.order(score: :desc)
    end
  end
end
