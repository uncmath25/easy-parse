import os
import xml.sax

from easyparse.pkg.xml_to_json_handler import XmlToJsonHandler
# flake8: noqa
from easyparse.tests.fixtures.import_samples import *


def test_xml_to_json(sample_json_output):
    xml_input_path = os.path.join('easyparse', 'data', 'input.xml')

    parser = xml.sax.make_parser()
    parser.setFeature(xml.sax.handler.feature_namespaces, 0)
    xml_handler = XmlToJsonHandler()
    parser.setContentHandler(xml_handler)
    parser.parse(xml_input_path)

    assert xml_handler.get_json_dict() == sample_json_output
