// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.prefabsoft.web;

import com.prefabsoft.domain.FakeDomainEntity;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect FakeDomainEntityController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String FakeDomainEntityController.create(@Valid FakeDomainEntity fakeDomainEntity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("fakeDomainEntity", fakeDomainEntity);
            return "fakedomainentitys/create";
        }
        uiModel.asMap().clear();
        fakeDomainEntity.persist();
        return "redirect:/fakedomainentitys/" + encodeUrlPathSegment(fakeDomainEntity.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String FakeDomainEntityController.createForm(Model uiModel) {
        uiModel.addAttribute("fakeDomainEntity", new FakeDomainEntity());
        return "fakedomainentitys/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String FakeDomainEntityController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("fakedomainentity", FakeDomainEntity.findFakeDomainEntity(id));
        uiModel.addAttribute("itemId", id);
        return "fakedomainentitys/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String FakeDomainEntityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("fakedomainentitys", FakeDomainEntity.findFakeDomainEntityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) FakeDomainEntity.countFakeDomainEntitys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("fakedomainentitys", FakeDomainEntity.findAllFakeDomainEntitys());
        }
        return "fakedomainentitys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String FakeDomainEntityController.update(@Valid FakeDomainEntity fakeDomainEntity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("fakeDomainEntity", fakeDomainEntity);
            return "fakedomainentitys/update";
        }
        uiModel.asMap().clear();
        fakeDomainEntity.merge();
        return "redirect:/fakedomainentitys/" + encodeUrlPathSegment(fakeDomainEntity.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String FakeDomainEntityController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("fakeDomainEntity", FakeDomainEntity.findFakeDomainEntity(id));
        return "fakedomainentitys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String FakeDomainEntityController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FakeDomainEntity.findFakeDomainEntity(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/fakedomainentitys";
    }
    
    @ModelAttribute("fakedomainentitys")
    public Collection<FakeDomainEntity> FakeDomainEntityController.populateFakeDomainEntitys() {
        return FakeDomainEntity.findAllFakeDomainEntitys();
    }
    
    String FakeDomainEntityController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
