connection: "musicbrainz"

include: "*.view.lkml"

#########################################################################################################

explore: release {

  join: album {
    relationship: many_to_one
    sql_on: ${release.album_id} = ${album.id} ;;
  }

  join: album_primary_type {
    fields: []
    relationship: many_to_one
    sql_on: ${album.primary_type_id} = ${album_primary_type.id} ;;
  }

  join: country {
    fields: []
    relationship: many_to_one
    sql_on: ${release_detail.country_id} = ${country.id} ;;
  }

  join: language {
    fields: []
    relationship: many_to_one
    sql_on: ${release.language_id} = ${language.id} ;;
  }

  join: packaging {
    fields: []
    relationship: many_to_one
    sql_on: ${release.packaging_id} = ${packaging.id} ;;
  }

  join: release_detail {
    fields: []
    relationship: one_to_many
    sql_on: ${release.id} = ${release_detail.release_id} ;;
  }

  join: release_status {
    fields: []
    relationship: many_to_one
    sql_on: ${release.release_status_id} = ${release_status.id} ;;
  }
}

#########################################################################################################

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
    sql_on:
      ${composing_link.link_type} = ${composing_link_type.id}
      AND ${composing_link_type.name} = 'composer' ;;
  }

  join: composer {
    from: artist
    relationship: many_to_one
    sql_on: ${composer.id} = ${link_artist_work.artist_id} ;;
    fields: [name, country, gender, type, count]
  }

  # Join to Place ###################################################################

  join: link_place_work {
    fields: []
    relationship: many_to_one
    sql_on: ${link_place_work.work_id} = ${work.id} ;;
  }

  join: premiere_link {
    fields: []
    from: link
    relationship: one_to_one
    sql_on: ${premiere_link.id} = ${link_place_work.detail_id} ;;
  }

  join: premiere_link_type {
    fields: []
    from: link_type
    relationship: many_to_one
    sql_on:
      ${premiere_link.link_type} = ${premiere_link_type.id}
      AND ${premiere_link_type.name} = 'premiere' ;;
  }

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

  join: country {
    fields: []
    relationship: many_to_one
    sql_on: ${composer.country_id} = ${country.id} ;;
  }

  # Place Details ###################################################################

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
