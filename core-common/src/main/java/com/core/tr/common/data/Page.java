package com.core.tr.common.data;

import com.core.tr.model.BaseDto;
import java.io.Serializable;
import java.util.List;

/**
 * @author bocal
 */
public class Page<E extends BaseDto> implements Serializable {

  private List<E> result;

  private PagingContext pagingContext;

  public Page(List<E> result, PagingContext pagingContext) {
    this.result = result;
    this.pagingContext = pagingContext;
  }

  public List<E> getResult() {
    return result;
  }

  public void setResult(List<E> result) {
    this.result = result;
  }

  public PagingContext getPagingContext() {
    return pagingContext;
  }

  public void setPagingContext(PagingContext pagingContext) {
    this.pagingContext = pagingContext;
  }
}
