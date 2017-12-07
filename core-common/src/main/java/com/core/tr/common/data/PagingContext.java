package com.core.tr.common.data;

import java.io.Serializable;

/**
 * @author bocal
 */
public class PagingContext implements Serializable {

  private Integer displayCount;

  private Integer index;

  private Integer totalCount;

  public PagingContext(Integer displayCount, Integer index, Integer totalCount) {
    this.displayCount = displayCount;
    this.index = index;
    this.totalCount = totalCount;
  }

  public Integer getDisplayCount() {
    return displayCount;
  }

  public void setDisplayCount(Integer displayCount) {
    this.displayCount = displayCount;
  }

  public Integer getIndex() {
    return index;
  }

  public void setIndex(Integer index) {
    this.index = index;
  }

  public Integer getTotalCount() {
    return totalCount;
  }

  public void setTotalCount(Integer totalCount) {
    this.totalCount = totalCount;
  }
}
