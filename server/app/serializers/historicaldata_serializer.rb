class HistoricaldataSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :ObjectId,
             :historicaldataattribute
end
