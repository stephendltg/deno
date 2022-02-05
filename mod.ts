#!/usr/bin/env deno run --allow-env --allow-run

import { log } from "./deps.ts";

/**
 * Adds x and y.
 * @param {number} x
 * @param {number} y
 * @returns {number} Sum of x and y
 */
export function add(x: number, y: number): number {
  return x + y;
}

/**
 * Uppercase string
 * @param {string} value
 * @returns {string} upppercase
 *
 * ```ts
 * const t = test('hello)
 * ```
 */
export function upperString(value: string): string {
  return value.toUpperCase();
}

log.info(upperString("Hello world!"));
