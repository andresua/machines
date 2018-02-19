CREATE TABLE stock (
    id              numeric(18,2),
    units           integer,
    
    PRIMARY KEY(id)
);

CREATE TABLE store (
    id              numeric(18,2),
    name            varchar(150),
    city            varchar(150),
    address         varchar(150),
    
    PRIMARY KEY(id)
);

CREATE TABLE product (
    id              numeric(18,2),
    name            varchar(150),
    description     varchar(350),
    weight          numeric(18,10),
    width           numeric(18,10),
    height          numeric(18,10),
    information     text
    
    PRIMARY KEY(id)
);

CREATE TABLE refund (
    id              numeric(18,2),
    refound_date    timestamp,
    cause           varchar(350),
    product_state   varchar(350),
    stock_entry     boolean,
    units           integer
    
    PRIMARY KEY(id)
);

CREATE TABLE stock_list (
    id              numeric(18,2),
    id_stock        numeric(18,2),
    id_product      numeric(18,2),
    id_refound      numeric(18,2)
    
    PRIMARY KEY(id),
    CONSTRAINT fk_stock FOREIGN KEY (id_stock, id_product, id_refound) REFERENCES stock (id),
    CONSTRAINT fk_refund FOREIGN KEY (id_stock, id_product, id_refound) REFERENCES refund (id),
    CONSTRAINT fk_product FOREIGN KEY (id_stock, id_product, id_refound) REFERENCES product (id)
);

