package com.huifu.base;

import java.io.File;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.jdom.xpath.XPath;

import com.huifu.constant.Constant;

/**
 * <p>Title: XML格式的参数配置文件读取类</p>
 */
public class XmlParam
{
    protected String strXmlFilePathName;
    protected Document document;

    /**
     * <p>构造函数</p>
     * 
     * @param strXmlFilePathName String 配置文件路径名
     */
    public XmlParam(String strXmlFilePathName)
    {
        this.strXmlFilePathName = strXmlFilePathName;
    }

    /**
     * <p>空构造函数，需后续调用loadXML加载xml字符串</p>
     */
    public XmlParam()
    {
    }

    /**
     * <p>获取配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @param strValDefault String 参数的缺省值
     * @return String 参数值，如果取值失败，则返回缺省值
     */
    public String getParamVal(String strXPath)
    {
        String strRet = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            strRet = ((Element) xpath.selectSingleNode(document)).getText();
        }
        catch (Exception e)
        {
        }

        return strRet;
    }

    /**
     * <p>获取配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return ArrayList 参数值list，如果取值失败，则返回缺省值
     */
    public ArrayList getParamVals(String strXPath)
    {
        List list = null;
        ArrayList stringarray = new ArrayList();
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(document);
            for (int nloop = 0; nloop < list.size(); nloop++)
            {
                stringarray.add(((Element) list.get(nloop)).getText());
            }
        }
        catch (Exception e)
        {
            stringarray = null;
        }

        return stringarray;
    }

    /**
     * <p>获取配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return ArrayList 参数值list，如果取值失败，则返回缺省值
     */
    public ArrayList getParamVals(Element element, String strXPath)
    {
        List list = null;
        ArrayList stringarray = new ArrayList();
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(element);
            for (int nloop = 0; nloop < list.size(); nloop++)
            {
                stringarray.add(((Element) list.get(nloop)).getText());
            }
        }
        catch (Exception e)
        {
            stringarray = null;
        }

        return stringarray;
    }

    /**
     * <p>获取配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return List[] 参数值list[]，存放对象元素的List数组
     */
    public List[] getNodeChildObjects(String strXPath)
    {
        List list = null;
        List childArray = new ArrayList();
        List[] listElement;
        Element element = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(document);

            //定义并初始化返回List数组
            listElement = new ArrayList[list.size()];
            for (int i=0; i<listElement.length; i++)
            {
                listElement[i] = new ArrayList();
            }
            
            //取xml节点各元素加到List数组中
            for (int nloop = 0; nloop < list.size(); nloop++)
            {
                childArray = ((Element) list.get(nloop)).getChildren(); 
                for (int i = 0; i<childArray.size(); i++)
                {
                    element = (Element)childArray.get(i);
                    listElement[nloop].add(element);
                }
            }
        }
        catch (Exception e)
        {
            childArray = null;
            listElement = null;
        }
        
        return listElement;
    }
    /**
     * <p>获取Records列表，每个Record一个hashmap   </p>
     * @author 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return List 参数值list，存放hashmap元素
     */
    public List getRecords(String strXPath)
    {
        List list = null;
        List childArray = new ArrayList();
        List listHashMap;
        Element element = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(document);

            //定义并初始化返回List数组
            listHashMap = new ArrayList();
           
            
            //取xml节点各元素加到List数组中
            for (int nloop = 0; nloop < list.size(); nloop++)
            {
                childArray = ((Element) list.get(nloop)).getChildren(); 
                HashMap hm=new HashMap();
                for (int i = 0; i<childArray.size(); i++)
                {
                    element = (Element)childArray.get(i);
                    hm.put(element.getName(), element.getText());
                    
                }
                listHashMap.add(hm);
            }
        }
        catch (Exception e)
        {
            childArray = null;
            listHashMap = null;
        }
        
        return listHashMap;
    }

    /**
     * <p>获取指定路径节点</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return List[] 节点链表
     */
    public List getNodes(String strXPath)
    {
        List list = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(document);
        }
        catch (Exception e)
        {
            list = null;
        }
        
        return list;
    }
    
    /**
     * <p>获取指定路径节点</p>
     *
     * @param Element element参数在XML文件中的xPath路径名
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @return List[] 节点链表
     */
    public List getNodes(Element element, String strXPath)
    {
        List list = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            list = xpath.selectNodes(element);
            // list = xpath.selectNodes(document);
        }
        catch (Exception e)
        {
            list = null;
        }
        
        return list;
    }
    
    /**
     * <p>获取指定路径节点下的参数值</p>
     * 
     * @param Element element jdom节点
     * @param strXPath String 参数在节点下的xPath路径名
     * @return String 
     */
    public String getNodeParamVal(Element element, String strXPath)
    {
        String strRet = null;
        try
        {
            XPath xpath = XPath.newInstance(strXPath);
            strRet = ((Element) xpath.selectSingleNode(element)).getText();
        }
        catch (Exception e)
        {
            strRet = null;
        }
        
        return strRet;
    }
    
    /**
     * <p>获取xml文件Node间所有字符串</p>
     * 
     * @param strXPath          String 参数在XML文件中的xPath路径名
     * @return String           输入参数节点间所有字符串
     */
    public String getNodeString(String strXPath)
    {
        Element element = null;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            element = (Element) xpath.selectSingleNode(document);
            
            XMLOutputter xmlOut = new XMLOutputter(Format.getPrettyFormat());
            return xmlOut.outputString(element);
        }
        catch (Exception e)
        {
            return null;
        }
    }
    
    /**
     * <p>获取xml文件Node的xml文本</p>
     * 
     * @param strXPath          String 参数在XML文件中的xPath路径名
     * @return String           输入参数节点间所有字符串
     */
    public String getNodeXmlText(Element element)
    {
        try
        {
            XMLOutputter xmlOut = new XMLOutputter(Format.getPrettyFormat());
            return xmlOut.outputString(element);
        }
        catch (Exception e)
        {
        }
        
        return null;
    }
    
    /**
     * <p>打开配置文件</p>
     * 
     * @return boolean 是否成功
     */
    public boolean open()
    {
        boolean bRet = false;
        try
        {
            SAXBuilder builder = new SAXBuilder();
            document = builder.build(new File(strXmlFilePathName));

            bRet = true;
        }
        catch (Exception e)
        {
        }

        return bRet;
    }

    /**
     * <p>加载xml字符串</p>
     * 
     * @return boolean 是否成功
     */
    public boolean loadXML(String strXmlText)
    {
        boolean bRet = false;
        try
        {
            StringReader sr = new StringReader(strXmlText);
            SAXBuilder builder = new SAXBuilder();
            document = builder.build(sr);
            
            bRet = true;
        }
        catch (Exception e)
        {
            /*
        	JournalThread.getInstance().append("0000", JournalThread.LEVEL_1,
                    "xml文件格式错误：" + strXmlText);
           */
        	e.printStackTrace();
        }

        return bRet;
    }

    /**
     * <p>创建新的xml文件</p>
     * 
     * @return boolean 是否成功
     */
    public boolean createXML()
    {
        boolean bRet = false;
        try
        {
            document = new Document();
            Element rootElement = new Element(Constant.XPATH_ROOT);
            document.setRootElement(rootElement);

            bRet = true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return bRet;
    }

    /**
     * <p>创建自定义节点的xml文件</p>
     * 
     * @return boolean 是否成功
     */
    public boolean createXML(String rootPath)
    {
        boolean bRet = false;
        try
        {
            document = new Document();
            Element rootElement = new Element(rootPath);
            document.setRootElement(rootElement);

            bRet = true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return bRet;
    }


    /**
     * <p>设置配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @param strValue String 参数的缺省值
     * @return boolean 操作结果 <p> 说明：节点不存在时将进行创建 </p>
     */
    public boolean setParamVal(String strXPath, String strValue)
    {
        boolean bRet = false;
        try
        {
            XPath xpath = XPath.newInstance("//" + strXPath);
            Element element = (Element) xpath.selectSingleNode(document);
            if (null != element)
            {
                element.setText(strValue);
            }
            else
            {
                Object[] strPaths = DataConversion.separate(strXPath, '/');
                if (strPaths.length < 1
                        || false == document.getRootElement().getName().equals(
                                (String) strPaths[0]))
                {
                    return false;
                }

                Element parentElement = document.getRootElement();
                for (int nLoop = 1; nLoop < strPaths.length; nLoop++)
                {
                    if (null == (element = (Element) parentElement
                            .getChild((String) strPaths[nLoop])))
                    {
                        element = new Element((String) strPaths[nLoop]);
                        parentElement.addContent(element);
                    }

                    parentElement = element;
                }

                element.setText(strValue);
            }

            bRet = true;
        }
        catch (Exception e)
        {
        	/*
            JournalThread.getInstance().append(
                    "0000",
                    JournalThread.LEVEL_1,
                    "设置xml参数错误，源xml：" + toString() + "\r\n路径：" + strXPath
                            + "; 值：" + strValue);
           */
        	e.printStackTrace();
        }

        return bRet;
    }

    /**
     * <p>设置指定节点下的配置参数值</p>
     * 
     * @param parentElement Element 需要添加参数的父节点，一般为调用appendNode得到的返回值
     * @param strXPath String 参数在节点中的的xPath路径名
     * @param strValue String 参数的缺省值
     * @return boolean 操作结果 <p> 说明： 节点不存在时将进行创建 </p>
     */
    public boolean setParamVal(Element parentElement, String strXPath,
            String strValue)
    {
        boolean bRet = false;
        try
        {
            Element element = null;
            Object[] strPaths = DataConversion.separate(strXPath, '/');
            for (int nLoop = 0; nLoop < strPaths.length; nLoop++)
            {
                if (null == (element = (Element) parentElement
                        .getChild((String) strPaths[nLoop])))
                {
                    element = new Element((String) strPaths[nLoop]);
                    parentElement.addContent(element);
                }

                parentElement = element;
            }

            element.setText(strValue);

            bRet = true;
        }
        catch (Exception e)
        {
        	/*
            JournalThread.getInstance().append(
                    "0000",
                    JournalThread.LEVEL_1,
                    "设置xml参数错误，源xml：" + toString() + "\r\n路径：" + strXPath
                            + "; 值：" + strValue);
            */
        	e.printStackTrace();
        }

        return bRet;
    }

    /**
     * <p>添加配置参数值</p>
     * 
     * @param strXPath String 参数在XML文件中的xPath路径名
     * @param strValue String 参数的缺省值
     * @return boolean 操作结果 <p> 说明：总是创建新的节点，用于实现多个同路径同名节点的创建 </p>
     */
    public boolean appendParamVal(String strXPath, String strValue)
    {
        boolean bRet = false;
        try
        {
            Object[] strPaths = DataConversion.separate(strXPath, '/');
            if (strPaths.length < 1
                    || false == document.getRootElement().getName().equals(
                            (String) strPaths[0]))
            {
                return false;
            }

            Element element = null;
            Element parentElement = document.getRootElement();
            for (int nLoop = 1; nLoop < strPaths.length - 1; nLoop++)
            {
                if (null == (element = (Element) parentElement
                        .getChild((String) strPaths[nLoop])))
                {
                    element = new Element((String) strPaths[nLoop]);
                    parentElement.addContent(element);
                }

                parentElement = element;
            }

            element = new Element((String) strPaths[strPaths.length - 1]);
            parentElement.addContent(element);
            element.setText(strValue);

            bRet = true;
        }
        catch (Exception e)
        {
        	/*
            JournalThread.getInstance().append(
                    "0000",
                    JournalThread.LEVEL_1,
                    "增加xml参数错误，源xml：" + toString() + "\r\n路径：" + strXPath
                            + "; 值：" + strValue);
        	*/
        	e.printStackTrace();
        }

        return bRet;
    }

    /**
     * <p>添加节点</p>
     * 
     * @param strXPath String 节点的xPath路径名
     * @return Element 新增加的节点 
     * <p> 说明：总是创建新的节点，用于实现多个同路径同名节点的创建 </p>
     */
    public Element appendNode(String strXPath)
    {
        return appendNode(document.getRootElement(), strXPath);
    }

    /**
     * <p>返回节点</p>
     * 
     * @param strXPath String 节点的xPath路径名
     * @return Element 指定路径的节点
     */
    public Element getNode(String strXPath)
    {
        try
        {
            XPath xpath = XPath.newInstance(strXPath);
            return (Element) xpath.selectSingleNode(document);
        }
        catch (Exception e)
        {
            return null;
        }
    }

    /**
     * <p>返回根节点</p>
     */
    public Element getRootNode()
    {
        return document.getRootElement();
    }
    
    /**
     * <p>添加节点</p>
     * 
     * @param strXPath String 节点的xPath路径名
     * @return Element 新增加的节点 <p> 说明：总是创建新的节点，用于实现多个同路径同名节点的创建 </p>
     */
    public Element appendNode(Element parentElement, String strXPath)
    {
        try
        {
            Object[] strPaths = DataConversion.separate(strXPath, '/');
            if (strPaths.length < 1)
            {
                return null;
            }

            Element element = null;
            for (int nLoop = 1; nLoop < strPaths.length - 1; nLoop++)
            {
                if (null == (element = (Element) parentElement
                        .getChild((String) strPaths[nLoop])))
                {
                    element = new Element((String) strPaths[nLoop]);
                    parentElement.addContent(element);
                }

                parentElement = element;
            }

            element = new Element((String) strPaths[strPaths.length - 1]);
            parentElement.addContent(element);

            return element;
        }
        catch (Exception e)
        {
        	/*
            JournalThread.getInstance()
                    .append(
                            "0000",
                            JournalThread.LEVEL_1,
                            "增加xml参数错误，源xml：" + toString() + "\r\n路径："
                                    + strXPath + ";");
        	 */
        	e.printStackTrace();
        }

        return null;
    }
    
    /**
     * <p>将指定节点中的所有内容放入到键值对Map中</p>
     * <p>  遍历节点路径</p>
     * <p>  若存在同名节点时，返回失败，防止取值失败</p>
     * @param strXPath 节点路径，表示根节点
     * @return HashMap 包含所有键值对的Map
     */
    public HashMap toHashMap(String strXPath)
    {
        HashMap mapRet = new HashMap();
        try
        {
            Element element = null;
            if (null == strXPath)
            {
                element = document.getRootElement();
            }
            else
            {
                XPath xpath = XPath.newInstance("//" + strXPath);
                element = (Element) xpath.selectSingleNode(document);
            }
            
            if (false == getElementValues(element, mapRet))
            {
                mapRet.clear();
                return null;
            }
        }
        catch (Exception e)
        {
            mapRet.clear();
            return null;
        }
        
        return mapRet;
    }
    
    /**
     * <p>私有：递归获取节点下的键值对到传入的Map中</p>
     * <p>  遍历节点路径</p>
     * <p>  若存在同名节点时，返回失败，防止取值失败</p>
     * @param element 节点
     * @return HashMap 包含所有键值对的Map
     */
    private boolean getElementValues(Element element, HashMap mapRet)
    {
        if (null == element)
        {
            return false;
        }
        
        try
        {
            List children = element.getChildren();
            if (null == children || children.size() <= 0)
            {
                // 不允许重名节点
                if (null == mapRet.get(element.getName()))
                {
                    mapRet.put(element.getName(), element.getText());
                    return true;
                }
                else
                {
                    return false;
                }
            }
            
            for (int nLoop = 0; nLoop < children.size(); nLoop ++)
            {
                if (false == getElementValues((Element)children.get(nLoop), mapRet))
                {
                    return false;
                }
            }
        }
        catch (Exception e)
        {
            return false;
        }

        return true;
    }
    
    /**
     * <p>输出xml字符串</p>
     */
    public String toString()
    {
        XMLOutputter xmlOut = new XMLOutputter(Format.getPrettyFormat());
        return xmlOut.outputString(document);
    }

    /**
     * <p>返回Document对象</p>
     */
    public Document getDocument()
    {
        return this.document;
    }
    
    /**
	 * <p>删除JDOM文档对象中的某个节点</p>
	 * @param doc Document JDOM文档对象
	 * @param strXPath String 节点的路径
	 */
	public void deleteSingleNode(String strXPath)
	{
		try
		{
			XPath xpath = XPath.newInstance("//" + strXPath);
			Element element = (Element) xpath.selectSingleNode(document);
			element.getParentElement().removeChild(element.getName());
		}
		catch (Exception e)
		{
		}
	}

    /**
     * <p>测试程序入口</p>
     * 
     * @param args String[] 参数
     */
    public static void main(String[] args) throws Exception
    {
        XmlParam xmlparam = new XmlParam();
       
        String xmlString="<?xml version='1.0' encoding='UTF-8'?><sample><p>123</p></sample>";
        /*
        xmlparam.loadXML(xmlString);
        xmlparam.deleteSingleNode("sample/p");
        System.out.println(xmlparam.toString());
        
        		xmlString+="<?xml version=\"1.0\"?><Request><Records><Record><TransactionName>withdrawer</TransactionName><StartTime>2010-07-24 10:00:00</StartTime><EndTime>2010-07-24 10:00:59</EndTime></Record>";
        		xmlString=xmlString + "<Record><TransactionName>withdrawer</TransactionName><StartTime>2010-07-25 10:00:00</StartTime><EndTime>2010-07-24 10:00:59</EndTime></Record></Records></Request>";

        		
        		 System.out.println(xmlString);
        		 xmlparam.loadXML(xmlString);
       		
        		 List listRecords=xmlparam.getRecords("Request/Records/Record");//获取Record
        		 for(Object hm:listRecords){
        			 HashMap hm2=(HashMap)hm;
        			 System.out.println(hm2.get("StartTime"));
        		 }
        		 */
        xmlString="<sample></sample>";
        xmlparam.loadXML(xmlString);
        Element rep=xmlparam.appendNode("sample/Response/TellerCase/Cash");
       
        xmlparam.setParamVal(rep,"name", "name1"); 
        xmlparam.setParamVal(rep,"count", "count1"); 
       
        rep=xmlparam.appendNode("sample/Response/TellerCase/Cash");
        
        xmlparam.setParamVal(rep,"name", "name2"); 
        xmlparam.setParamVal(rep,"count", "count2"); 
        
       // System.out.println(xmlparam.toString());
      
   		
    } 
   
}
