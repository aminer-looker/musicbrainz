view: artist_credit_name {
  sql_table_name: musicbrainz.artist_credit_name ;;

  # Dimensions ########################################################################

  # Hidden Fields #####################################################################

  dimension: artist_id {
    hidden: yes
    type: number
    sql: ${TABLE}.artist ;;
  }

  dimension: artist_credit_id {
    hidden: yes
    type: number
    sql: ${TABLE}.artist_credit ;;
  }
}
