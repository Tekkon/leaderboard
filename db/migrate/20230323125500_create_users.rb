class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE SEQUENCE public.users_id_seq
      INCREMENT 1
      START 1
      MINVALUE 1
      MAXVALUE 9223372036854775807
      CACHE 1;

      CREATE TABLE users (
        id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
        name character varying COLLATE pg_catalog."default" NOT NULL,
        score integer NOT NULL DEFAULT 0,
        created_at timestamp(6) without time zone NOT NULL,
        updated_at timestamp(6) without time zone NOT NULL,
        CONSTRAINT users_partitioned_pkey PRIMARY KEY (id, score)
      ) PARTITION BY RANGE (score);

      CREATE TABLE users_1 PARTITION OF users
      FOR VALUES FROM (150) TO (100000);

      CREATE TABLE users_2 PARTITION OF users
      FOR VALUES FROM (100000) TO (200000);

      CREATE TABLE users_3 PARTITION OF users
      FOR VALUES FROM (200000) TO (300000);

      CREATE TABLE users_4 PARTITION OF users
      FOR VALUES FROM (300000) TO (400000);

      CREATE TABLE users_5 PARTITION OF users
      FOR VALUES FROM (400000) TO (500000);

      CREATE TABLE users_6 PARTITION OF users
      FOR VALUES FROM (500000) TO (600000);

      CREATE TABLE users_7 PARTITION OF users
      FOR VALUES FROM (600000) TO (700000);

      CREATE TABLE users_8 PARTITION OF users
      FOR VALUES FROM (700000) TO (800000);

      CREATE TABLE users_9 PARTITION OF users
      FOR VALUES FROM (800000) TO (900000);

      CREATE TABLE users_10 PARTITION OF users
      FOR VALUES FROM (900000) TO (1000001);
    SQL

    add_reference :users, :country, index: true, foreign_key: true
    add_index :users_1, :score, order: { score: :desc }
    add_index :users_1, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_2, :score, order: { score: :desc }
    add_index :users_2, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_3, :score, order: { score: :desc }
    add_index :users_3, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_4, :score, order: { score: :desc }
    add_index :users_4, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_5, :score, order: { score: :desc }
    add_index :users_5, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_6, :score, order: { score: :desc }
    add_index :users_6, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_7, :score, order: { score: :desc }
    add_index :users_7, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_8, :score, order: { score: :desc }
    add_index :users_8, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_9, :score, order: { score: :desc }
    add_index :users_9, %i[country_id score], order: { country_id: :asc, score: :desc }
    add_index :users_10, :score, order: { score: :desc }
    add_index :users_10, %i[country_id score], order: { country_id: :asc, score: :desc }
  end

  def down
    drop_table :users_1
    drop_table :users_2
    drop_table :users_3
    drop_table :users_4
    drop_table :users_5
    drop_table :users_6
    drop_table :users_7
    drop_table :users_8
    drop_table :users_9
    drop_table :users_10
    drop_table :users
  end
end
