package common.vo;

public class CodeVO {

	private String cdDtlName;
	private String cdDtlParentId;
	private String cdDtlId;
	private String cdDtlDesc;
	private String cdDtlUseYn;
	private String url;
	private String[] params;
	
	
	public String[] getParams() {
		return params;
	}

	public void setParams(String[] params) {
		this.params = params;
	}

	public String getCdDtlUseYn() {
		return cdDtlUseYn;
	}

	public void setCdDtlUseYn(String cdDtlUseYn) {
		this.cdDtlUseYn = cdDtlUseYn;
	}

	public String getCdDtlId() {
		return cdDtlId;
	}

	public void setCdDtlId(String cdDtlId) {
		this.cdDtlId = cdDtlId;
	}

	public String getCdDtlDesc() {
		return cdDtlDesc;
	}

	public void setCdDtlDesc(String cdDtlDesc) {
		this.cdDtlDesc = cdDtlDesc;
	}

	public String getCdDtlName() {
		return cdDtlName;
	}

	public void setCdDtlName(String cdDtlName) {
		this.cdDtlName = cdDtlName;
	}
	
	public String getCdDtlParentId() {
		return cdDtlParentId;
	}
	
	public void setCdDtlParentId(String cdDtlParentId) {
		this.cdDtlParentId = cdDtlParentId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	
	
	
	
}
