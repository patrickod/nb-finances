#!/usr/bin/env python2.7

import csv
import sys
import argparse

def format_row(row):
  return (
    row[11], # id
    row[4], # type
    float_to_cents(row[6]), # gross
    float_to_cents(row[7]), # fee
    float_to_cents(row[8]), # net
    row[9], # from_email
    row[10], # to_email
    row[14], # title
    "%s %s" % (row[0], row[1])
  )

def float_to_cents(c):
  c = c.replace(',', '')

  if c[0] == '-':
    value = -float(c[1:])
  else:
    value = float(c)

  cents = value * 100
  return int(cents)

def valid_row(r):
  return len(r[5]) and len(r[6])

def parse_csv(path):
  with open(path, 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    headers = reader.next()
    writer = csv.writer(sys.stdout)

    for row in reader:
      try:
        to_insert = format_row(row)
        if valid_row(to_insert):
          writer.writerow(to_insert)
      except:
        pass

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Convert PayPal transaction CSV to CSV suitable for PostgreSQL')
  parser.add_argument('file', metavar='f', type=str, help='CSV file from PayPal')

  args = parser.parse_args()

  if args.file:
    parse_csv(sys.argv[1])

