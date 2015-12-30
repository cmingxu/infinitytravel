task :abc => :environment do
  dev_spec = {:adapter => :sqlite, :database => "development.sqlite3"}
  pro_spec = {:adapter => :sqlite, :database => "production.sqlite3"}

  Dir.glob(Rails.root.to_s + "/app/models/*").each do |model|
    require model
  end

  ActiveRecord::Base.subclasses.each do |model|
    next unless model.send(:table_exists?)
    model.send(:all).each do |record|
      model.column_names.each do |c|
        next unless record.send(c).is_a?(CarrierWave::Uploader::Base)
        next if record.send(c).to_s.nil?
        puts record.send(c)
        #puts "update #{model.table_name} set #{c}=\"#{record.send(c).to_s.split('/').last}\" where id=#{record.id};"
      end
    end
  end
end
