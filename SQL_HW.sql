-- Table: public.card_holder

-- DROP TABLE public.card_holder;

CREATE TABLE IF NOT EXISTS public.card_holder
(
    cardholder_id integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT card_holder_pkey PRIMARY KEY (cardholder_id)
)

TABLESPACE pg_default;

ALTER TABLE public.card_holder
    OWNER to postgres;

-- Table: public.credit_card

-- DROP TABLE public.credit_card;

CREATE TABLE IF NOT EXISTS public.credit_card
(
    card character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cardholder_id integer,
    CONSTRAINT credit_card_pkey PRIMARY KEY (card),
    CONSTRAINT credit_card_cardholder_id_fkey FOREIGN KEY (cardholder_id)
        REFERENCES public.card_holder (cardholder_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.credit_card
    OWNER to postgres;


-- Table: public.merchant

-- DROP TABLE public.merchant;

CREATE TABLE IF NOT EXISTS public.merchant
(
    merchant_id integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    merchant_category_id integer,
    CONSTRAINT merchant_pkey PRIMARY KEY (merchant_id),
    CONSTRAINT merchant_merchant_category_id_fkey FOREIGN KEY (merchant_category_id)
        REFERENCES public.merchant_category (merchant_category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.merchant
    OWNER to postgres;


-- Table: public.merchant_category

-- DROP TABLE public.merchant_category;

CREATE TABLE IF NOT EXISTS public.merchant_category
(
    merchant_category_id integer NOT NULL,
    name character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT merchant_category_pkey PRIMARY KEY (merchant_category_id)
)

TABLESPACE pg_default;

ALTER TABLE public.merchant_category
    OWNER to postgres;

-- Table: public.transaction_activity

-- DROP TABLE public.transaction_activity;

CREATE TABLE IF NOT EXISTS public.transaction_activity
(
    transaction_activity_id integer NOT NULL,
    date timestamp without time zone,
    amount double precision,
    card character varying(20) COLLATE pg_catalog."default",
    merchant_id integer,
    CONSTRAINT transaction_activity_pkey PRIMARY KEY (transaction_activity_id),
    CONSTRAINT transaction_activity_card_fkey FOREIGN KEY (card)
        REFERENCES public.credit_card (card) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT transaction_activity_merchant_id_fkey FOREIGN KEY (merchant_id)
        REFERENCES public.merchant (merchant_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.transaction_activity
    OWNER to postgres;

