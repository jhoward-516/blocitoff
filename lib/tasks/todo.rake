namespace :todo do
  desc "Deletes items when item expire_at date is reached"
  task delete_items: :environment do
    Item.where("expire_at <= ?", Time.now).destroy_all
  end

end
