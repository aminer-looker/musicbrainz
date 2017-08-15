view: artist_facts {
  derived_table: {
    sql: SELECT
        artist_credit.id as "id",
        artist_credit.name  AS "name",
        COUNT(DISTINCT release.id ) AS "lifetime_releases"
      FROM musicbrainz.release  AS release
      LEFT JOIN musicbrainz.artist_credit  AS artist_credit ON release.artist_credit = artist_credit.id
      LEFT JOIN aminer_scratch.LR$U6UTP1XI6CKD4YCD289VD_release_detail AS release_detail ON release.id = release_detail.release

      WHERE (artist_credit.name <> 'Various Artists' AND artist_credit.name <> '[unknown]' OR artist_credit.name IS NULL) AND (((((to_date(to_char(release_detail.date_year, '0000'), 'YYYY')) ) >= (TIMESTAMP '1100-01-01') AND ((to_date(to_char(release_detail.date_year, '0000'), 'YYYY')) ) < (TIMESTAMP '2016-01-01'))))
      GROUP BY 1,2
      ORDER BY 2 DESC,1
       ;;
  }

  # Dimensions ########################################################################

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: lifetime_releases {
    type: number
    sql: ${TABLE}.lifetime_releases ;;
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
}
