connection: "musicbrainz"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: work {

  # Join to Composer ################################################################

  join: link_artist_work {
    fields: []
    relationship: many_to_one
    sql_on: ${work.id} = ${link_artist_work.work_id} ;;
  }

  join: composing_link {
    fields: []
    from: link
    relationship: one_to_one
    sql_on: ${composing_link.id} = ${link_artist_work.details_id} ;;
  }

  join: composing_link_type {
    fields: []
    from: link_type
    relationship: many_to_one
    sql_on: ${composing_link.link_type} = ${composing_link_type.id} ;;
  }

  sql_always_where: ${composing_link_type.name} = 'composer' ;;

  join: composer {
    from: artist
    relationship: many_to_one
    sql_on: ${composer.id} = ${link_artist_work.artist_id} ;;
    fields: [name, gender, type, count]
  }

  # Join to Place ###################################################################

  join: link_place_work {
    fields: []
    relationship: many_to_one
    sql_on: ${link_place_work.work_id} = ${work.id} ;;
  }

  join: place_link_detail {
    fields: []
    from: link
    relationship: one_to_one
    sql_on: ${place_link_detail.id} = ${link_place_work.detail_id} ;;
  }

  join: place_link_detail_type {
    fields: []
    from: link_type
    relationship: many_to_one
    sql_on: ${place_link_detail.link_type} = ${place_link_detail_type.id} ;;
  }

  sql_always_where: ${place_link_detail_type.name} = 'premiere';;

  join: premiere_location {
    from: place
    fields: [address, coordinates, count, name, type]
    relationship: many_to_one
    sql_on: ${link_place_work.place_id} = ${premiere_location.id} ;;
  }

  # Composer Details ################################################################

  join: artist_type {
    fields: []
    relationship: many_to_one
    sql_on: ${composer.type_id} = ${artist_type.id} ;;
  }

  join: gender {
    from: gender
    fields: []
    relationship: many_to_one
    sql_on: ${composer.gender_id} = ${gender.id} ;;
  }

  # PLace Details ###################################################################

  join: place_type {
    fields: []
    relationship: one_to_one
    sql_on: ${premiere_location.type_id} = ${place_type.id} ;;
  }

  # Work Details ####################################################################

  join: language {
    fields: []
    relationship: many_to_one
    sql_on: ${language.id} = ${work.language_id} ;;
  }

  join: work_type {
    fields: []
    relationship: one_to_one
    sql_on: ${work.type_id} = ${work_type.id} ;;
  }
}
