package br.edu.ifc.videira.miniaturas.model;

/** Bytes da imagem + tipo MIME (image/jpeg, image/png...). */
public record Imagem(byte[] bytes, String tipo) { }
