namespace :update_image_data do
  desc "イメージデータを更新するタスク"

  task :update, [] => :environment do |task, args|
    Item.where(image: nil).each_with_index do |item, idx|
      begin
        ActiveRecord::Base.transaction do
          p "Item:[#{item.name}]がない為、追加します。"
          file = "db/images/items/#{item.name}.jpg"
          item.update!(image: File.open(file)) if File.exist?(file)
        end
      rescue => e
        p e
      end
    end
  end

end
