# RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
#   config.default = RGeo::Geos.factory_generator
#
#   config.register(
#     RGeo::Geographic.simple_mercator_factory.projection_factory,
#     srid: 3857,
#     geo_type: 'Point',
#     sql_type: 'geometry(Point,3857)'
#   )
#
#   config.register(
#     RGeo::Geographic.simple_mercator_factory.projection_factory,
#     srid: 3857,
#     geo_type: 'MultiPolygon',
#     sql_type: 'geometry(MultiPolygon,3857)'
#   )
# end
