import sys
import os
from lxml import etree

def main():
    if len(sys.argv) < 2:
        print("Error: Please drag a file onto this tool.")
        input("Press Enter to close...")
        return

    input_file = sys.argv[1]
    exe_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
    xsl_path = os.path.join(exe_dir, "style.xsl")
    output_path = os.path.splitext(input_file)[0] + ".html"

    try:
        # We use a special parser to ignore DTDs that often crash journal XMLs
        parser = etree.XMLParser(recover=True, resolve_entities=False, no_network=True)
        
        xml_tree = etree.parse(input_file, parser=parser)
        xsl_tree = etree.parse(xsl_path)
        
        transform = etree.XSLT(xsl_tree)
        result = transform(xml_tree)

        # Check if transformation actually produced something
        if result is None:
            print("Error: The transformation failed. Check if your XML is valid.")
        else:
            with open(output_path, "wb") as f:
                f.write(etree.tostring(result, pretty_print=True, method="html"))
            print(f"Success! Created: {os.path.basename(output_path)}")
            os.startfile(output_path)

    except Exception as e:
        print(f"An error occurred: {e}")
    
    input("\nPress Enter to close...")

if __name__ == "__main__":
    main()

    